class SupportRequest < ActiveRecord::Base

  DEPARTMENT_SALES = "sales".freeze
  DEPARTMENT_MARKETING = "marketing".freeze
  DEPARTMENT_TECHNICAL = "techincal".freeze

  DEPARTMENTS  = [ DEPARTMENT_SALES, 
                   DEPARTMENT_MARKETING,
                   DEPARTMENT_TECHNICAL]


  def self.search(search_term)
    if search_term
      where("LOWER(title) LIKE :search_term OR 
             LOWER(email) LIKE :search_term OR 
             LOWER(description) LIKE :search_term",
             {search_term: "%#{search_term.downcase}%"})
    else
      all
    end
  end

end
