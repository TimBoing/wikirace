class RoundScoreComputer
  def call
    compute_points
    compute_rank
  end

  private
  attr_reader :round
  attr_accessor :round_participations

  def initialize(round)
    @round = round
    @round_participations = @round.round_participations
  end

  def compute_points
    round_participations.each do |round_participation|
      if round_participation.visited_pages.first.title == round.start_page && round_participation.visited_pages.last.title == round.end_page
        round_participation.update(score: 100)
      end
    end

    losers = []

    round_participations.each do |round_participation|
      losers << round_participation if round_participation.score == 0
    end

    losers.each do |round_participation|
      round_participation.update(score: - (round_participation.visited_pages.count))
    end
  end

  def compute_rank
    round_participations = @round.round_participations
    round_participations = round_participations.sort_by{ |round_participation| round_participation.score}.reverse
    rank_counter = 0
    round_participations.each do |round_participation|
      rank_counter += 1
      round_participation.update(rank: rank_counter)
    end
  end
end
