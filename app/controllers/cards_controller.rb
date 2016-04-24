class CardsController < ApplicationController

  before_action :signed_in_user

  before_action :set_card, only: [:show, :edit, :update, :destroy, :toggle_completed]

  # GET /cards
  # GET /cards.json
  def index
    @cards = current_user.cards.order(created_at: :desc)
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    @card.user = current_user

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

  def toggle_completed
    @todo.completed = !@todo.completed
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path }
        format.json { render :show, status: :ok, location: @todo }
      else
        # show some error message
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :profession, :email, :phone, :websites, :skills)
    end
end
