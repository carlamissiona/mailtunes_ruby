class RadiosController < ApplicationController
  before_action :set_radio, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # GET /radios or /radios.json
  def index
    @radios = Radio.all
  end

  # GET /radios/1 or /radios/1.json
  def show
  end

  # GET /radios/new
  def new
    @radio = Radio.new
  end

  # GET /radios/1/edit
  def edit
  end
  
  # def search
  #     @radios = Radio.where('name ILIKE ?', "%#{params[:name_search]}%").order(created_at: :desc)
  #     respond_to do |format|
  #       format.turbo_stream do
  #           render turbo_stream: [
  #             turbo_stream.update("search_results",
  #             partial: "radios/search_results",
  #             locals: { radios:  @radios })
  #           ]
  #       end
  #     end
  #   end
def search
    if params.dig(:name_search).present?
      puts "params.dig(:name_search)"
      puts "params.dig(:name_search)"
      puts "params.dig(:name_search)"
      puts "params.dig(:name_search)"
      puts "params.dig(:name_search)"
      puts "params.dig(:name_search)"
      puts "params.dig(:name_search)" 
 puts "params.dig(:name_search)" 
 
      
      @radios = Radio.where('name LIKE ?', "%#{params[:name_search]}%") 
    else
        @radios = []
    end
       respond_to do |format|
      format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("search_results",
            partial: "radios/search_results",
            locals: { radios:    @radios , radio: @radio })
          ]
      end
    end
       
         
       
    
  end
  
  # POST /radios or /radios.json
  def create
    @radio = Radio.new(radio_params)

    respond_to do |format|
      if @radio.save
        format.html { redirect_to radio_url(@radio), notice: "Radio was successfully created." }
        format.json { render :show, status: :created, location: @radio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @radio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radios/1 or /radios/1.json
  def update
    respond_to do |format|
      if @radio.update(radio_params)
        format.html { redirect_to radio_url(@radio), notice: "Radio was successfully updated." }
        format.json { render :show, status: :ok, location: @radio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @radio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radios/1 or /radios/1.json
  def destroy
    @radio.destroy

    respond_to do |format|
      format.html { redirect_to radios_url, notice: "Radio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio
      if params.dig(:name_search).present?
           @radio = []
      end
       if params[:id].to_i != 0
          @radio = Radio.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def radio_params
      params.require(:radio).permit(:name, :url)
    end
end
