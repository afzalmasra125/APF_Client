class Review
  attr_accessor :reviewer_id, :reviewee_id, :relationship, :judgement, :teamwork, :leadership, :technical, :positive_feedback, :needs_improvement, :manager_id, :manager_status, :email

  def initialize(input_options)  
    @reviewer_id = input_options['reviewer_id']
    @reviewee_id = input_options['reviewee_id']
    @relationship = input_options['relationship']
    @judgement = input_options['judgement']
    @teamwork = input_options['teamwork']
    @leadership = input_options['leadership']
    @technical = input_options['technical']
    @positive_feedback = input_options['positive_feedback']
    @needs_improvement = input_options['needs_improvement']
    @manager_id = input_options['manager_id']
    @manager_status = input_options['manager_status']
    @email = input_options['email']
  end

  def self.convert_hashs(review_hashs)
    collection = []

    review_hashs.each do |review_hash|
      collection << Review.new(review_hash)
    end

    collection
  end
end
