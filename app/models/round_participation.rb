class RoundParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :visited_pages
  validates :user, presence: true
  validates :round, presence: true
  validates :user, uniqueness: { scope: :round, message: "There can only be a RP per user per round" }

  def rank_for_round
    @round = self.round
    @round_participations = @round.round_participations
    case self.round.game_mode

    when "Premier arrivé"
      @round_participations.each { |round_participation|
        if round_participation.visited_pages.last == round_participation.round.end_page
          @rank = 1
        else
          @round_participations.sort_by{ |round_participation| round_participation.visited_pages.count }
          @rank = @round_participations.index(self) + 1
        end
      }

    when "Limite de temps"
      @round_participations.each { |round_participation|
        if round_participation.visited_pages.last == round_participation.round.end_page
          @round_participations.sort_by{ |round_participation| round_participation.visited_pages.last.created_at }
          @rank = @round_participations.index(self) + 1
        else
          @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
          @rank = @round_participations.index(self) + 1
        end
      }

    when "Limite de clicks"
      @round_participations.each { |round_participation|
        if round_participation.visited_pages.last == round_participation.round.end_page
          @round_participations.sort_by{ |round_participation| round_participation.visited_pages.count }
          @rank = @round_participations.index(self) + 1
        else
          @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
          @rank = @round_participations.index(self) + 1
        end
      }

    when "Limite de temps & clicks"
      @round_participations.each { |round_participation|
        if round_participation.visited_pages.last == round_participation.round.end_page
          @round_participations.sort_by{ |round_participation| round_participation.visited_pages.count }
          #TODO: je n'ai pas fait le 2em niveau de sorting (dans le cas ou l'on a le meme nombre de click mais un temps différent)
          @rank = @round_participations.index(self) + 1
        else
          @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
          @rank = @round_participations.index(self) + 1
        end
      }

    when "Pas de limites"
      @round_participations.each { |round_participation|
        if round_participation.visited_pages.last != round_participation.round.end_page
          @rank = nil
        else
          @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
          @rank = @round_participations.index(self) + 1
        end
      }

    else
      raise error
    end

    return @rank
  end

  def score_for_round
    case self.round.game_mode

    when "Premier arrivé"
      if self.rank == 1
          @score = 100
      else
          @score = - self.visited_pages.count
      end

    when "Limite de temps"
      if self.rank == 1
        @score = 100
      elsif self.rank == 2
        @score = 50
      elsif self.rank == 3
        @score = 25
      elsif self.rank == nil
        @score = - self.visited_pages.count
      else
        @score = 10
      end

    when "Limite de clicks"
      if self.rank == 1
        @score = 100
      elsif self.rank == 2
        @score = 50
      elsif self.rank == 3
        @score = 25
      elsif self.rank == nil
        @score = - ( self.visited_pages.last.created_at - round_participation.round.start_time ) / 10000
      else
        @score = 10
      end

    when "Limite de temps & clicks"
      if self.rank == 1
        @score = 100
      elsif self.rank == 2
        @score = 50
      elsif self.rank == 3
        @score = 25
      elsif self.rank == nil
        @score = - self.visited_pages.count - ( self.visited_pages.last.created_at - round_participation.round.start_time ) / 10000
      else
        @score = 10
      end

    when "Pas de limites"
      if self.rank == 1
        @score = 100
      elsif self.rank == 2
        @score = 50
      elsif self.rank == 3
        @score = 25
      elsif self.rank == nil
        @score = - self.visited_pages.count - ( self.visited_pages.last.created_at - round_participation.round.start_time ) / 10000
      else
        @score = 10
      end

    else
      raise error
    end

    return @score
  end
end
