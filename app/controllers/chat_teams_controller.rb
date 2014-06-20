class ChatTeamsController < ApplicationController
  before_action :set_chat_team, only: [:show, :edit, :update, :destroy, :chat]

  def chat
    @chat_team.chat_logs.create(params.require(:chat_log).permit(:message))
    redirect_to @chat_team
  end

  # GET /chat_teams
  # GET /chat_teams.json
  def index
    @chat_teams = ChatTeam.all
  end

  # GET /chat_teams/1
  # GET /chat_teams/1.json
  def show
    @chat_logs = ChatLog.all
  end

  # GET /chat_teams/new
  def new
    @chat_team = ChatTeam.new
  end

  # GET /chat_teams/1/edit
  def edit
  end

  # POST /chat_teams
  # POST /chat_teams.json
  def create
    @chat_team = ChatTeam.new(chat_team_params)

    respond_to do |format|
      if @chat_team.save
        format.html { redirect_to @chat_team, notice: 'Chat team was successfully created.' }
        format.json { render :show, status: :created, location: @chat_team }
      else
        format.html { render :new }
        format.json { render json: @chat_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_teams/1
  # PATCH/PUT /chat_teams/1.json
  def update
    respond_to do |format|
      if @chat_team.update(chat_team_params)
        format.html { redirect_to @chat_team, notice: 'Chat team was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_team }
      else
        format.html { render :edit }
        format.json { render json: @chat_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_teams/1
  # DELETE /chat_teams/1.json
  def destroy
    @chat_team.destroy
    respond_to do |format|
      format.html { redirect_to chat_teams_url, notice: 'Chat team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_team
      @chat_team = ChatTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_team_params
      params.require(:chat_team).permit(:name, :user_id)
    end
end
