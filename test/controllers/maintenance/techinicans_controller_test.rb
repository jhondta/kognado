# frozen_string_literal: true

require 'test_helper'

class Maintenance::TechinicansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_techinican = maintenance_techinicans(:one)
  end

  test 'should get index' do
    get maintenance_techinicans_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_techinican_url
    assert_response :success
  end

  test 'should create maintenance_techinican' do
    assert_difference('Maintenance::Techinican.count') do
      post maintenance_techinicans_url, params: { maintenance_techinican: { active: @maintenance_techinican.active, certificacion_level: @maintenance_techinican.certificacion_level, specialty: @maintenance_techinican.specialty, user_id: @maintenance_techinican.user_id } }
    end

    assert_redirected_to maintenance_techinican_url(Maintenance::Techinican.last)
  end

  test 'should show maintenance_techinican' do
    get maintenance_techinican_url(@maintenance_techinican)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_techinican_url(@maintenance_techinican)
    assert_response :success
  end

  test 'should update maintenance_techinican' do
    patch maintenance_techinican_url(@maintenance_techinican), params: { maintenance_techinican: { active: @maintenance_techinican.active, certificacion_level: @maintenance_techinican.certificacion_level, specialty: @maintenance_techinican.specialty, user_id: @maintenance_techinican.user_id } }
    assert_redirected_to maintenance_techinican_url(@maintenance_techinican)
  end

  test 'should destroy maintenance_techinican' do
    assert_difference('Maintenance::Techinican.count', -1) do
      delete maintenance_techinican_url(@maintenance_techinican)
    end

    assert_redirected_to maintenance_techinicans_url
  end
end
