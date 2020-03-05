class RoundParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :visited_pages
  validates :user, presence: true
  validates :round, presence: true
  validates :user, uniqueness: { scope: :round, message: "There can only be a RP per user per round" }

  def is_the_best?
    start_page = WikiPage.where(title: self.round.start_page)
    end_page = WikiPage.where(title: self.visited_pages.last.title)
    record_path = Path.find_by(start_page: start_page, end_page: end_page)
    if record_path.blank?
      return true
    else
      clicks_number_record = record_path.points.count
      clicks_number_new = self.visited_pages.count
      if clicks_number_new < clicks_number_record
        return true
      elsif record_path.user_id == self.user_id && clicks_number_new = clicks_number_record
        return true
      end
      return false
    end
  end

  def save_record(current_user)
    start_page_title = self.round.start_page
    if WikiPage.find_by(title: start_page_title).blank?
      WikiPage.create(title: start_page_title, url: self.round.start_page_url)
    end
    start_page = WikiPage.find_by(title: start_page_title)
    end_page_title = self.visited_pages.last.title
    if WikiPage.find_by(title: end_page_title).blank?
      WikiPage.create(title: end_page_title, url: self.round.end_page_url)
    end
    end_page = WikiPage.find_by(title: end_page_title)

    record_path = Path.find_by(start_page: start_page, end_page: end_page)

    # creation of the new path
    if record_path.blank?
      Path.create(user: current_user, start_page: start_page, end_page: end_page, duration: (self.end_time.to_i - self.round.start_time.to_i))
    else
      record_path.update(user: current_user, start_page: start_page, end_page: end_page, duration: (self.end_time.to_i - self.round.start_time.to_i))
      record_path.points.each {|point| point.destroy}
    end

    # creation of points after the creation of the new WikiPages
    record_path = Path.find_by(start_page: start_page, end_page: end_page)
    position = 0
    self.visited_pages.each {|visited_page|
      if WikiPage.find_by(title: visited_page.title).blank?
        WikiPage.create(title: visited_page.title, url: visited_page.url)
      end
      position += 1
      Point.create(position: position, wiki_page: WikiPage.find_by(title: visited_page.title), path: record_path)
    }
  end

  # def rank_for_round
  #   @round = self.round
  #   @round_participations = @round.round_participations
  #   case self.round.game_mode

  #   when "Premier arrivé"
  #     @round_participations.each { |round_participation|
  #       if round_participation.visited_pages.last == round_participation.round.end_page
  #         @rank = 1
  #       else
  #         @round_participations.sort_by{ |round_participation| round_participation.visited_pages.count }
  #         @rank = @round_participations.index(self) + 1
  #       end
  #     }

  #   when "Limite de temps"
  #     @round_participations.each { |round_participation|
  #       if round_participation.visited_pages.last == round_participation.round.end_page
  #         @round_participations.sort_by{ |round_participation| round_participation.visited_pages.last.created_at }
  #         @rank = @round_participations.index(self) + 1
  #       else
  #         @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
  #         @rank = @round_participations.index(self) + 1
  #       end
  #     }

  #   when "Limite de clicks"
  #     @round_participations.each { |round_participation|
  #       if round_participation.visited_pages.last == round_participation.round.end_page
  #         @round_participations.sort_by{ |round_participation| round_participation.visited_pages.count }
  #         @rank = @round_participations.index(self) + 1
  #       else
  #         @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
  #         @rank = @round_participations.index(self) + 1
  #       end
  #     }

  #   when "Limite de temps & clicks"
  #     @round_participations.each { |round_participation|
  #       if round_participation.visited_pages.last == round_participation.round.end_page
  #         @round_participations.sort_by{ |round_participation| round_participation.visited_pages.count }
  #         #TODO: je n'ai pas fait le 2em niveau de sorting (dans le cas ou l'on a le meme nombre de click mais un temps différent)
  #         @rank = @round_participations.index(self) + 1
  #       else
  #         @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
  #         @rank = @round_participations.index(self) + 1
  #       end
  #     }

  #   when "Pas de limites"
  #     @round_participations.each { |round_participation|
  #       if round_participation.visited_pages.last != round_participation.round.end_page
  #         @rank = nil
  #       else
  #         @round_participations.sort_by{ |round_participation| round_participation.user.score_for_round }
  #         @rank = @round_participations.index(self) + 1
  #       end
  #     }

  #   else
  #     raise error
  #   end

  #   return @rank
  # end

  # def score_for_round
  #   case self.round.game_mode

  #   when "Premier arrivé"
  #     if self.rank == 1
  #         @score = 100
  #     else
  #         @score = - self.visited_pages.count
  #     end

  #   when "Limite de temps"
  #     if self.rank == 1
  #       @score = 100
  #     elsif self.rank == 2
  #       @score = 50
  #     elsif self.rank == 3
  #       @score = 25
  #     elsif self.rank == nil
  #       @score = - self.visited_pages.count
  #     else
  #       @score = 10
  #     end

  #   when "Limite de clicks"
  #     if self.rank == 1
  #       @score = 100
  #     elsif self.rank == 2
  #       @score = 50
  #     elsif self.rank == 3
  #       @score = 25
  #     elsif self.rank == nil
  #       @score = - ( self.visited_pages.last.created_at - round_participation.round.start_time ) / 10000
  #     else
  #       @score = 10
  #     end

  #   when "Limite de temps & clicks"
  #     if self.rank == 1
  #       @score = 100
  #     elsif self.rank == 2
  #       @score = 50
  #     elsif self.rank == 3
  #       @score = 25
  #     elsif self.rank == nil
  #       @score = - self.visited_pages.count - ( self.visited_pages.last.created_at - round_participation.round.start_time ) / 10000
  #     else
  #       @score = 10
  #     end

  #   when "Pas de limites"
  #     if self.rank == 1
  #       @score = 100
  #     elsif self.rank == 2
  #       @score = 50
  #     elsif self.rank == 3
  #       @score = 25
  #     elsif self.rank == nil
  #       @score = - self.visited_pages.count - ( self.visited_pages.last.created_at - round_participation.round.start_time ) / 10000
  #     else
  #       @score = 10
  #     end

  #   else
  #     raise error
  #   end

  #   return @score
  # end
end
