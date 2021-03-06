class CardsController < ApplicationController

  before_action :signed_in_user
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = current_user.cards.order(created_at: :desc)
  end

  # GET /cards/#id => example /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/#id/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    @card.user = current_user
    # respond to user request for new form, save it, redirect to card index page
    respond_to do |format|
      if @card.save
        format.html { redirect_to cards_path, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    #espond to user request for specific card id, to both edit & save it, then redirect to card index page
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to cards_path, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_path, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
  #security, verifying the correct user has passed authN, and authZ is given to their account
    def verify_correct_user
       @card = current_user.cards.find_by(id: params[:id])
       redirect_to root_url, notice: 'Access Denied!' if @card.nil?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # the below is done so no one else who has access to code can change this
    def card_params
      params.require(:card).permit(:card_name, :name, :profession, :email, :phone, :websites, :skills)
    end
end
