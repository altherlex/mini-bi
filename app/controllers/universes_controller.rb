class UniversesController < MiniBiController
  # GET /universes
  # GET /universes.json
  def index
    @universes = Universe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @universes }
    end
  end

  # GET /universes/1
  # GET /universes/1.json
  def show
    @universe = Universe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @universe }
    end
  end

  # GET /universes/new
  # GET /universes/new.json
  def new
    @universe = Universe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @universe }
    end
  end

  # GET /universes/1/edit
  def edit
    @universe = Universe.find(params[:id])
  end

  # POST /universes
  # POST /universes.json
  def create
    @universe = Universe.new(params[:universe])

    respond_to do |format|
      if @universe.save
        format.html { redirect_to @universe, notice: 'Universe was successfully created.' }
        format.json { render json: @universe, status: :created, location: @universe }
      else
        format.html { render action: "new" }
        format.json { render json: @universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /universes/1
  # PUT /universes/1.json
  def update
    @universe = Universe.find(params[:id])

    respond_to do |format|
      if @universe.update_attributes(params[:universe])
        format.html { redirect_to @universe, notice: 'Universe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universes/1
  # DELETE /universes/1.json
  def destroy
    @universe = Universe.find(params[:id])
    @universe.destroy

    respond_to do |format|
      format.html { redirect_to universes_url }
      format.json { head :no_content }
    end
  end
  
  def execute
    result = 
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
    respond_to do |format|
      #format.html #TODO show the executed sql 
      format.csv { send_data result }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end # execute
end
