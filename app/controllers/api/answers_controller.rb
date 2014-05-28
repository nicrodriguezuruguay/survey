class Api::AnswersController < ApplicationController
  def index
  end

  def create
    @params = permitted_params[:answer]
    #@answer=Question.find_by name: (params[:name])

    @questionExist = Question.find_by(id: params[:question_id])
    #BUSCO SI EXISTE LA ENCUESTA PARA AGREGAR LA PREGUNTA,
    #SI EXISTE LA AGREGA SINO DA ERROR 404
    unless @questionExist.nil?
    	 @answer = Answer.new(:question_id=>params[:question_id],:answer =>params[:answer])

    	if @answer.save
    		render :json => @answer
    	end

    else
     	render :text => "No existe la pregunta", :status => 404
   	end
  end

  def permitted_params
    params.permit(answer: [:question_id, :answer])
  end

end