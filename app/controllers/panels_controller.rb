class PanelsController < MiniBiController
  include MiniBiHelper

  # GET /panels
  # GET /panels.json
  def index
    @panels = Panel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @panels }
    end
  end

  # GET /panels/1
  # GET /panels/1.json
  def show
    @panel = Panel.find(params[:id])
    @widget = Widget.new

    respond_to do |format|
      if params[:print].present? || params[:p].present?
        format.html {render "panels/print", :layout => 'clean'}
      else
        format.html # show.html.erb
      end
      format.json { render json: @panel }
      format.pdf { 
        #str_template = Delayed::Job.enqueue render_to_string("panels/print", layout:'clean', formats: :html)
        #str_template = render_to_string("panels/print", layout:'clean', formats: :html)
        str_template =  request.url.sub request.original_fullpath, panel_path(@panel, layout:100, print:true)
     #raise str_template.inspect
        #str_template = request.host+"pame"
        pdf = PDFKit.new str_template, {redirect_delay:5000}
        send_data pdf.to_pdf, filename: "#{@panel.name.gsub(' ', '_')}#{I18n.l(Time.now, :format => :to_pdf)}.pdf", type: "application/pdf"
      }
    end
  end

  def panel_pdf_download(panel)
    kit = PDFKit.new("http://10.0.37.44:3000/panels/#{panel.id}/?layout=100&print=true", redirect_delay:5000)
    # Get an inline PDF
    file = kit.to_file(Rails.root.join('assets', 'data', 'panel_1.pdf'))
    pdf = kit.to_pdf
    send_data pdf, :filename => "#{panel.title}.pdf", :type => "application/pdf"
    #send_file '/assets/data/abc.pdf', :type=>"application/pdf", :x_sendfile=>true
  end

  # GET /panels/new
  # GET /panels/new.json
  def new
    @panel = Panel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @panel }
    end
  end

  # GET /panels/1/edit
  def edit
    @panel = Panel.find(params[:id])
  end

  # POST /panels
  # POST /panels.json
  def create
    @panel = Panel.new(params[:panel])

    respond_to do |format|
      if @panel.save
        format.html { redirect_to @panel, notice: 'Panel was successfully created.' }
        format.json { render json: @panel, status: :created, location: @panel }
      else
        format.html { render action: "new" }
        format.json { render json: @panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /panels/1
  # PUT /panels/1.json
  def update
    @panel = Panel.find(params[:id])

    respond_to do |format|
      if @panel.update_attributes(params[:panel])
        format.html { redirect_to @panel, notice: 'Panel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panels/1
  # DELETE /panels/1.json
  def destroy
    @panel = Panel.find(params[:id])
    @panel.destroy

    respond_to do |format|
      format.html { redirect_to panels_url }
      format.json { head :no_content }
    end
  end
end
