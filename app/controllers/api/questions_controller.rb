class Api::QuestionsController < ApplicationController
  def index
  end

  def create
    @params = permitted_params[:question]
    #@question=Question.find_by name: (params[:name])

    @surveyExist = Survey.find(params[:surveasy_id])
    #BUSCO SI EXISTE LA ENCUESTA PARA AGREGAR LA PREGUNTA,
    #SI EXISTE LA AGREGA SINO DA ERROR 404
    unless @surveyExist.nil?
    	 @question = Question.new(:question=>params[:question],:surveasy_id =>params[:surveasy_id])

    	if @question.save
    		render :json => @question
    	end

    else
     render :text => "No existe la encuesta", :status => 404
   	end
  end

  def permitted_params
    params.permit(question: [:surveasy_id, :question])
  end

end