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
    # render :json => @clue_info
    #     return

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
  end

  def mainpage
    # @elements = params[:id]
    # @case=CaseInfo.find(params[:id])
    @case_info=CaseInfo.all
    # render :json => @case_info.name
    #      return
    render :layout => false
  end

  def main
    render :layout => false
    @case_info=CaseInfo.all
  end

end
