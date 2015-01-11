class ReviewsController < ApplicationController
  def index
  end

  def show
    @positive = 0
    @negative = 0
    @sum = 0
    @reviews = Review.where(lesson_id: params[:id]).page(params[:page]).order("id,'DESC'").per(10)
    @lesson= Lesson.find(params[:id])
    @reviews.each do |review|
      @sum += 1 
      if review.emotion == "P"
        @positive += 1
      else
        @negative += 1
      end
      @pp =@positive*100.0/@sum
      @np =@negative*100.0/@sum
    end
    @average=Review.average(:rate,:conditions => ["lesson_id = #{params[:id]}"]).round
# binding.pry
  end

  def create
    # params[]http://mueki.net/twana/api.php
    require 'net/http'
    require 'uri'
    #POSTするだけ
    res = Net::HTTP.post_form(URI.parse('http://mueki.net/twana/api.php'),
                          {'q'=>params[:review], 'max'=>'50'})
    # puts res.body
    if params[:nickname].empty? then
      params[:nickname] = "名無し"
    end
    @review = Review.new(nickname: params[:nickname],rate: params[:rate], review: params[:review], lesson_id: params[:lesson_id],emotion: res.body)
    if @review.save then
      redirect_to "/reviews/#{params[:lesson_id]}"
    else
      redirect_to "/review/#{params[:lesson_id]}?alert=1"
    end
      
  end

end
