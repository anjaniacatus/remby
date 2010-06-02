class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.xml
  def index
    if params[:compagny_id]
      #@compagny = Compagny.find(params[:society_id])
      #@jobs = @compagny.jobs
      @jobs = Job.find(:all)
    else
      @jobs = Job.find(:all)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Job.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    #if params[:society_id]
      #@compagny = Society.find(params[:society_id])
      #@job = @compagny.jobs.new
    #else
    @job = Job.new
    @function = Function.new
    @localisation = Localisation.new
    @contract = Contract.new
    
    flash[:error] = t(:cannot_find_jobs, :default => "Misy diso")
    #end
  end

  # GET /jobs/1/edit
  def edit
    if params[:compagny_id]
      #@compagny = Compagny.find(params[:society_id])
      @job = @compagny.jobs.find(params[:id])
    else
      @job = Job.find(params[:id])
      flash[:error] = t(:cannot_find_jobs, :default => "Misy diso")
    end
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    #@compagny = Society.find(params[:society_id])
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        flash[:notice] = 'job was successfully created.'
        format.html { redirect_to(@job) }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        flash[:notice] = 'job was successfully updated.'
        format.html { redirect_to(@job) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.find(params[:id])
    #@job = Job.find(params[:id], :include => :compagny)
    #@compagny = @job.compagny
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(@compagny) }
      format.xml  { head :ok }
    end
  end
end