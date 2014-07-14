class ChatTeamsController < ApplicationController
  before_action :must_login, except: :index
  before_action :set_chat_team, only: [:show, :edit, :update, :destroy, :chat]

  def chat
    @chat_team.chat_logs.create(params.require(:chat_log).permit(:message))
    redirect_to @chat_team
  end

  def index
    @chat_teams = ChatTeam.all
  end

  def show
    @chat_logs = ChatLog.all
  end

  def new
    @chat_team = ChatTeam.new
    @users = User.where("users.id <> ?", current_user.id)
  end

  def edit
    @users = User.all
  end

  def create
    @chat_team = ChatTeam.new(chat_team_params)
    @chat_team.user_id = current_user.id
    @chat_team.users = User.where("id in (?)", params[:user_id])

    respond_to do |format|
      if @chat_team.valid?
        @chat_team.save!
        format.html { redirect_to chat_teams_url, notice: 'Chat team was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @chat_team.attributes = chat_team_params
    @chat_team.users = User.where("id in (?)", params[:user_id])

    respond_to do |format|
      if @chat_team.valid?
        @chat_team.save!
        format.html { redirect_to chat_teams_url, notice: 'Chat team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @chat_team.destroy
    respond_to do |format|
      format.html { redirect_to chat_teams_url, notice: 'Chat team was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_team
      @chat_team = ChatTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_team_params
      params.require(:chat_team).permit(:name)
    end
end
