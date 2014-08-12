class WelcomeController < ApplicationController
  def index
    @case_id = CaseInfo.find(3)

    @case=CaseInfo.last
    # @suspects_name=[VictimInfo.first.name+ ", Victim"] + @case.suspect_infos.map{|i| "#{i.name}, #{i.relation}"}
    @suspects_name=[@case.victim_infos.first.name+ ", Victim"] + @case.suspect_infos.map { |i| "#{i.name}, #{i.relation}" }
    # @suspects_name=[@case.victim_infos.map{|i| i.name}+ ", Victim"] + @case.suspect_infos.map{|i| "#{i.name}, #{i.relation}"}
    gon.suspects_name = @suspects_name
    # @images = [VictimInfo.first.image.url] + @case.suspect_infos.map{|i| i.image.url}
    @images = [@case.victim_infos.first.image.url] + @case.suspect_infos.map { |i| i.image.url }
    gon.images= @images
    @suspect_bios=[@case.victim_infos.first.info] + @case.suspect_infos.map { |i| i.information }
    gon.sb=@suspect_bios

    @suspect_sr=['']+ @case.suspect_infos.map { |i| i.interrogate }
    gon.sr=@suspect_sr

    @crimescene=CrimeScene.all
    @cord= @case.clue_infos.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" }
    gon.cord=@cord

    @statement=@case.clue_infos.map { |i| "#{i.hover}|| #{i.image.url}|| #{i.info}" }
    gon.stmt=@statement

    @childcord=@case.clue_infos.map { |i| i.children.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" } }
    gon.childcordinate=@childcord
    @childdata=@case.clue_infos.map { |i| i.children.map { |i| "#{i.hover}|| #{i.image.url}|| #{i.info}" } }
    gon.childrendata=@childdata

    @facebook_id=@case.facebook_id
    gon.faceid=@facebook_id

    #  @clue_info=@case.crime_scenes.map{|i| "#{i.comment}, #{i.image.url}"}
    # gon.clue_data=@clue_info

  end

  def archive
    @case_id = CaseInfo

    @case=CaseInfo.find(params[:id])
    # @suspects_name=[VictimInfo.first.name+ ", Victim"] + @case.suspect_infos.map{|i| "#{i.name}, #{i.relation}"}
    @suspects_name=[@case.victim_infos.first.name+ ", Victim"] + @case.suspect_infos.map { |i| "#{i.name}, #{i.relation}" }
    # @suspects_name=[@case.victim_infos.map{|i| i.name}+ ", Victim"] + @case.suspect_infos.map{|i| "#{i.name}, #{i.relation}"}
    gon.suspects_name = @suspects_name

    # @images = [VictimInfo.first.image.url] + @case.suspect_infos.map{|i| i.image.url}
    @images = [@case.victim_infos.first.image.url] + @case.suspect_infos.map { |i| i.image.url }
    gon.images= @images
    @suspect_bios=[@case.victim_infos.first.info] + @case.suspect_infos.map { |i| i.information }
    gon.sb=@suspect_bios

    @suspect_sr=['']+ @case.suspect_infos.map { |i| i.interrogate }
    gon.sr=@suspect_sr

    @crimescene=CrimeScene.all
    @cord= @case.clue_infos.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" }
    gon.cord=@cord

    @statement=@case.clue_infos.map { |i| "#{i.hover}|| #{i.image.url}|| #{i.info}" }
    gon.stmt=@statement

    @childcord=@case.clue_infos.map { |i| i.children.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" } }
    gon.childcordinate=@childcord
    @childdata=@case.clue_infos.map { |i| i.children.map { |i| "#{i.hover}|| #{i.image.url}|| #{i.info}" } }
    gon.childrendata=@childdata

    @facebook_id=@case.facebook_id
    gon.faceid=@facebook_id

    @crime_scene = @case.crime_scenes.first
    # @crime_info=@case.crime_scenes.map{|i| "#{i.comment}, #{i.image.url}"}
    # gon.clue_data=@crime_info
    # render :json => @crime_info
    #     return
    # render :json => @case_id
    # return
    # render :json => gon.images
    # return

  end

  def mainpage
    # @elements = params[:id]
    # @case=CaseInfo.find(params[:id])
    @case_info=CaseInfo.all
    gon.json={
        :timeline=>
            {
                :headline=>"",
                :type=>"default",
                :text=>"The Sachin Memory Project",
                :score=>"",
                :date=>
                    @case_info.map do |i|
                      {
                          :startDate=>i.date.strftime("%Y,%m,%d"),
                          :headline=>i.name,
                          :text=>i.description,
                          :asset=>
                              {
                                  :media=>i.media,
                                  :caption=>""
                              }
                      }
                    end
            }
    }.to_json

    # render :json => gon.json
    #      return
    #render :layout => false
  end


  def main
    render :layout => false
    @case_info=CaseInfo.all
  end





  def test_link
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(3)
        render :json => @case, :callback => params[:callback]
      end
    end
  end

  def get_case_title
    # @case = CaseInfo.find(3)
    # render :json => @case.name,:callback => params[:callback]
    # return
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(3)
        render :json => @case, :callback => params[:callback]
      end
    end
  end

  def get_case_info
    @case_array = Array.new()
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        render :json => @case, :callback => params[:callback]
      end
    end
  end

  def get_case_description
    @case = CaseInfo.find(params[:case_id][0])
    render :text => @case.description
    return
  end

  def get_suspect_info
    respond_to do |format|
      format.js do
        @case_suspect_info = CaseInfo.find(params[:case_id][0]).suspect_infos
        # @suspect_array = Array.new()
        # @case.suspect_infos.each do |suspect|
        #   @suspect_array << "#{suspect.name}||#{suspect.relation}||#{suspect.interrogate}||#{suspect.information}||#{suspect.image.url}"
        # end
        render :json=>@case_suspect_info, :callback => params[:callback]
        # return
        # render :json=>@case, :callback => params[:callback]
      end
    end
  end

  # def get_victim_info
  #   respond_to do |format|
  #     format.js do
  #       @case = CaseInfo.find(params[:case_id][0])
  #       @victim_array = Array.new()
  #       @suspect_victim_array = Array.new()
  #       @case.victim_infos.each do |victim|
  #         @victim_array << "#{victim.name}||#{victim.info}||#{victim.image.url}"
  #       end
  #       render :json=>@victim_array, :callback => params[:callback]
  #     end
  #   end
  # end

  def get_clue_info
    respond_to do |format|
      format.js do
        @clue_data = CaseInfo.find(params[:case_id][0]).crime_scenes
        render :json=>@clue_data, :callback => params[:callback]
    # return
      end
    end
  end

  def get_clue_crime_info
    respond_to do |format|
      format.js do
        @clue_info = CaseInfo.find(params[:case_id][0])
        @crimescene=CrimeScene.all
        @cord= @clue_info.clue_infos.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" }

        render :json=>@cord, :callback => params[:callback]
    #     return
      end
    end
  end

  def get_clue_stmt_info
    respond_to do |format|
      format.js do
        @clue_info = CaseInfo.find(params[:case_id][0])
        @statement=@clue_info.clue_infos.map { |i| "#{i.hover}|| #{i.image.url}|| #{i.info}" }
        render :json=>@statement , :callback => params[:callback]
            # return
      end
    end
end
  def get_child_cord
    respond_to do |format|
      format.js do
        @clue_child = CaseInfo.find(params[:case_id][0])
        @childcord=@clue_child.clue_infos.map { |i| i.children.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" } }
        render :json=>@childcord
        # return
         # return
      end
      end
  end
  def get_children_data
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @child_data=@case.clue_infos.map { |i| i.children.map { |i| "#{i.hover}|| #{i.image.url}|| #{i.info}" } }
        render :json=>@child_data, :callback => params[:callback]
        # return
        # return
      end
    end
  end

  def get_suspects_name
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @suspects_name=[@case.victim_infos.first.name+ ", Victim"] + @case.suspect_infos.map { |i| "#{i.name}, #{i.relation}" }
        render :json=>@suspects_name, :callback => params[:callback]
        # return
        # return
      end
    end
  end
  def get_images
    # respond_to do |format|
    #   format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @images = [@case.victim_infos.first.image.url] + @case.suspect_infos.map { |i| i.image.url }
        render :json=>@images, :callback => params[:callback]
        # return
        # return
    #   end
    # end
  end
  def get_suspect_bios
    # respond_to do |format|
    #   format.js do
    @case = CaseInfo.find(params[:case_id][0])
    @suspect_bios=[@case.victim_infos.first.info] + @case.suspect_infos.map { |i| i.information }
    render :json=>@images, :callback => params[:callback]
    # return
    # return
    #   end
    # end
  end


  end
#