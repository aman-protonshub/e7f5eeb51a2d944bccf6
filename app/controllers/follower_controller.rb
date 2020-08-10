class FollowerController < ApplicationController
	before_action :add_all_questions
	before_action :find_user, only: :follow_user
	before_action :find_topic_id, only: :follow_topic

	def follow_user
		binding.pry
		follower = @user.user_followers.create(follower_id: current_user.id) if validate_following_user?
		@errors = follower.errors
		render 'home/index'
	end

	def follow_topic
		follower = current_user.topic_followers.create(topic_id: @topic_id)
		@errors = follower.errors
		render "home/index"
	end

	private
	def find_user
		@user = Question.find(params[:id]).user
	end
	def find_topic_id
		@topic_id = Question.find(params[:id]).topic_id
	end
	def add_all_questions
		@questions = Question.all
	end
	def validate_following_user?
		current_user.id == @user.id ? false : true
	end
end
