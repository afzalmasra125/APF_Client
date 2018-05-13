module ReviewsController

  def reviews_index
    review_hashs = get_request('/reviews')
    reviews_index_view(reviews)
  end

  def reviews_show
    input_id = reviews_id_form
    review_hash = get_request('/reviews/#{input_id}')
    review = Review.new(review_hash)

    reviews_show_view(review)
  end

  def reviews_create
    client_params = reviews_new_form
    json_data = post_request('/reviews', client_params)
    
    if !json_data['errors']
      reviews = Review.new(json_data)
      reviews_show_view(review)
    else
      errors = json_data['errors']
      reviews_errors_view(errors)
    end
  end
 
  def reviews_update
    input_id = reviews_id_form
    reviews_hash = get_request('/reviews/#{input_id')
    review = Review.new(review_hash)

    client_params = reviews_update_form(reviews)
    json_data = patch_request('/reviews/#{input_id}', client_params)

    if !json_data['errors']
      review = Review.new(json_data)
      reviews_show_view(reviews)
    else
      errors = json_data['errors']
      reviews_errors_view(errors)
  end 

  def reviews_destroy
    input_id = reviews_id_form
    json_data = delete_request('/reviews/#{input_id}')
    puts json_data['message']
  end 
end