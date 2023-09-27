module Visitable
  def accept(visitor)
    visitor.visit(self)
  end
end

class Team
  include Visitable

  attr_reader :name, :city, :coach, :wins, :loses

  def initialize(name:, city:, coach:, wins:, loses:)
    @name = name
    @city = city
    @coach = coach
    @wins = wins
    @loses = loses
  end
end

class League
  include Visitable

  def initialize
    @teams = []
  end

  def add_team(team)
    @teams.push(team)
  end

  def accept(visitor)
    @teams.each do |team|
      team.accept(visitor)
    end
  end
end

class Visitor
  def visit(subject)
    raise NotImplementedError.new
  end
end

class TeamPrinterVisitor < Visitor
  def visit(subject)
    puts "Team: #{subject.name}"
    puts "City: #{subject.city}"
    puts "Coach: #{subject.coach}"
    puts "-------------------"
  end
end

class WinningRecordVisitor < Visitor
  def visit(subject)
    puts "Team: #{subject.name}"
    puts "Wins: #{subject.wins}"
    puts "Loses: #{subject.loses}"
    puts "Winning Percentage: #{calculate_winning_percentage(subject)}%"
    puts "-------------------"
  end

  def calculate_winning_percentage(team)
    total_games = team.wins + team.loses
    return 0 if total_games == 0

    winning_percentage = (team.wins.to_f / total_games) * 100
    winning_percentage.round(2)
  end
end

team1 = Team.new(name: 'Arizona Cardinals', city: 'Kansas City', coach: 'Cliff Kingsbury', wins: 4, loses: 13)
team2 = Team.new(name: 'San Francisco 49ers', city: 'San Francisco', coach: 'Kyle Shanahan', wins: 13, loses: 4)
team3 = Team.new(name: 'Seattle Seahawks', city: 'Seattle', coach: 'Pete Carroll', wins: 9, loses: 8)


league = League.new
league.add_team(team1)
league.add_team(team2)
league.add_team(team3)

league.accept(TeamPrinterVisitor.new)
league.accept(WinningRecordVisitor.new)
