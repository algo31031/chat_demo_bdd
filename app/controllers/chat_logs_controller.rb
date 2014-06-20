class ChatLogsController < ApplicationController
  before_action :set_chat_log, only: [:show, :edit, :update, :destroy]

  # GET /chat_logs
  # GET /chat_logs.json
  def index
    @chat_logs = ChatLog.all
  end

  # GET /chat_logs/1
  # GET /chat_logs/1.json
  def show
  end

  # GET /chat_logs/new
  def new
    @chat_log = ChatLog.new
  end

  # GET /chat_logs/1/edit
  def edit
  end

  # POST /chat_logs
  # POST /chat_logs.json
  def create
    @chat_log = ChatLog.new(chat_log_params)

    respond_to do |format|
      if @chat_log.save
        format.html { redirect_to @chat_log, notice: 'Chat log was successfully created.' }
        format.json { render :show, status: :created, location: @chat_log }
      else
        format.html { render :new }
        format.json { render json: @chat_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_logs/1
  # PATCH/PUT /chat_logs/1.json
  def update
    respond_to do |format|
      if @chat_log.update(chat_log_params)
        format.html { redirect_to @chat_log, notice: 'Chat log was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_log }
      else
        format.html { render :edit }
        format.json { render json: @chat_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_logs/1
  # DELETE /chat_logs/1.json
  def destroy
    @chat_log.destroy
    respond_to do |format|
      format.html { redirect_to chat_logs_url, notice: 'Chat log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_log
      @chat_log = ChatLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_log_params
      params.require(:chat_log).permit(:message)
    end
end
