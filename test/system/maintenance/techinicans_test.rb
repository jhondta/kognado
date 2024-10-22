# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::TechinicansTest < ApplicationSystemTestCase
  setup do
    @maintenance_techinican = maintenance_techinicans(:one)
  end

  test 'visiting the index' do
    visit maintenance_techinicans_url
    assert_selector 'h1', text: 'Techinicans'
  end

  test 'should create techinican' do
    visit maintenance_techinicans_url
    click_on 'New techinican'

    check 'Active' if @maintenance_techinican.active
    fill_in 'Certificacion level', with: @maintenance_techinican.certificacion_level
    fill_in 'Specialty', with: @maintenance_techinican.specialty
    fill_in 'User', with: @maintenance_techinican.user_id
    click_on 'Create Techinican'

    assert_text 'Techinican was successfully created'
    click_on 'Back'
  end

  test 'should update Techinican' do
    visit maintenance_techinican_url(@maintenance_techinican)
    click_on 'Edit this techinican', match: :first

    check 'Active' if @maintenance_techinican.active
    fill_in 'Certificacion level', with: @maintenance_techinican.certificacion_level
    fill_in 'Specialty', with: @maintenance_techinican.specialty
    fill_in 'User', with: @maintenance_techinican.user_id
    click_on 'Update Techinican'

    assert_text 'Techinican was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Techinican' do
    visit maintenance_techinican_url(@maintenance_techinican)
    click_on 'Destroy this techinican', match: :first

    assert_text 'Techinican was successfully destroyed'
  end
end
