require 'test_helper'

class PnjsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pnj = pnjs(:one)
  end

  test "should get index" do
    get pnjs_url
    assert_response :success
  end

  test "should get new" do
    get new_pnj_url
    assert_response :success
  end

  test "should create pnj" do
    assert_difference('Pnj.count') do
      post pnjs_url, params: { pnj: { q1: @pnj.q1, q2: @pnj.q2, score: @pnj.score, studentid: @pnj.studentid } }
    end

    assert_redirected_to pnj_url(Pnj.last)
  end

  test "should show pnj" do
    get pnj_url(@pnj)
    assert_response :success
  end

  test "should get edit" do
    get edit_pnj_url(@pnj)
    assert_response :success
  end

  test "should update pnj" do
    patch pnj_url(@pnj), params: { pnj: { q1: @pnj.q1, q2: @pnj.q2, score: @pnj.score, studentid: @pnj.studentid } }
    assert_redirected_to pnj_url(@pnj)
  end

  test "should destroy pnj" do
    assert_difference('Pnj.count', -1) do
      delete pnj_url(@pnj)
    end

    assert_redirected_to pnjs_url
  end
end
