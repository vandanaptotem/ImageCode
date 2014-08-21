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

  def get_case_info         # for Case Name  in id caseName row line no 22
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        render :json => @case, :callback => params[:callback]
      end
    end
  end

  def get_case_description    # for Case Description in id=briefing line no 27
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        render :json => @case.description, :callback => params[:callback]
      end
    end
    # return
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
  def get_clue_info
    respond_to do |format|
      format.js do
        @clue_data = CaseInfo.find(params[:case_id][0]).crime_scenes
        render :json=>@clue_data, :callback => params[:callback]
    # return
      end
    end
  end

  def get_clue_crime_info_cord  # for variable lvl1Nodes
    # respond_to do |format|
    #   format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @crimescene=CrimeScene.all
        @cord= @case.clue_infos.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" }
        render :json=>@cord, :callback => params[:callback]
        return
    #   end
    # end
  end

  def get_clue_stmt_info   # for variable lvl1Data
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @statement=@case.clue_infos.map { |i| "#{i.hover}|| #{"http://192.168.2.37:3000"+i.image.url}|| #{i.info}" }
        @cord= @case.clue_infos.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" }
        @crime_scene = @case.crime_scenes.first
        @url=@crime_scene.image.url
        @crime_scene = @case.crime_scenes.first
        @comments=@crime_scene.comments
        @comb = @statement, @url, @cord, @comments
        render :json=>@comb, :callback => params[:callback]
        # return
      end
    end
end
  def get_child_cord       # for variable lvl2Nodes
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @childcord=@case.clue_infos.map { |i| i.children.map { |i| "#{i.cord_x}, #{i.cord_y}, #{i.cord_z}, #{i.cord_w}" } }
        render :json=>@childcord, :callback => params[:callback]
        # return
         # return
      end
      end
  end
  def get_children_data    # for variable lvl2Data
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @child_data=@case.clue_infos.map { |i| i.children.map { |i| "#{i.hover}|| #{"http://192.168.2.37:3000"+i.image.url}|| #{i.info}" } }
        render :json=>@child_data, :callback => params[:callback]
        # return
        # return
      end
    end
  end

  def get_suspects_name    # for variable suspectNames
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
  def get_images           # for variable suspectPhotos
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
  def get_suspect_bios     # for variable suspectBios
    # respond_to do |format|
    #   format.js do
    @case = CaseInfo.find(params[:case_id][0])
    @suspect_bios=[@case.victim_infos.first.info] + @case.suspect_infos.map { |i| i.information }
    render :json=>@suspect_bios, :callback => params[:callback]
    return
    # return
    #   end
    # end
  end
  def get_suspect_sr       # for variable suspectReactions
    respond_to do |format|
      format.js do
    @case = CaseInfo.find(params[:case_id][0])
    @suspect_sr=['']+ @case.suspect_infos.map { |i| i.interrogate }
    render :json=>@suspect_sr, :callback => params[:callback]
    # return
    # return
      end
    end
  end

  def get_clue_image_comments       # in place of  <div class="col-lg-5 crimeSceneOverlay lvl1">
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @crime_scene = @case.crime_scenes.first

        render :json=>@crime_scene, :callback => params[:callback]
        # return
        # return
      end
    end
  end
  def get_clue_image_url       # in place of  <div class="col-lg-5 crimeSceneOverlay lvl1">
    respond_to do |format|
      format.js do
        @case = CaseInfo.find(params[:case_id][0])
        @crime_scene = @case.crime_scenes.first
        @url=@crime_scene.image.url
        render :json=>@url, :callback => params[:callback]
        # return
        # return
      end
    end
  end

  def save_post
    respond_to do |format|
      format.js do
        # Inquiry.create(:question_id=>@question.id.to_i, :respondent_id=>res.id.to_i)
        # @name = params[:name]
        #  Case.update(:name => @name).save
        render :json => params
        return
      end
    end
    # comments.create(:type=>'BMW',:colour=>"blue")

  end

  end
#
