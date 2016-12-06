# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find { |candidate| candidate[:id] == id }
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def of_age?(candidate)
  candidate[:age] > 17
end

def application_date?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def github_points?(candidate)
  candidate[:github_points] >= 100
end

def languages?(candidate)
  (candidate[:languages].include?("Ruby") ||
  candidate[:languages].include?("Python"))
end

def qualified_candidates(candidates)
  vetted_candidates = candidates.select do |candidate|
    github_points?(candidate) && experienced?(candidate) &&
    of_age?(candidate) && application_date?(candidate) &&
    languages?(candidate)
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort do |candidate_a, candidate_b|
    [candidate_a[:years_of_experience], candidate_a[:github_points]] <=>
    [candidate_b[:years_of_experience], candidate_b[:github_points]]
    # Another way to sort
    # candidates.sort_by do |candidate|
    #   [candidate[:years_of_experience], candidate[:github_points]]
    # end.reverse
  end.reverse
end
# More methods will go below
