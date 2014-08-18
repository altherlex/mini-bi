require 'test_helper'

class ColumnsControllerTest < ActionController::TestCase
  setup do
    @column = columns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:columns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create column" do
    assert_difference('Column.count') do
      post :create, column: { dsc_sql_valores: @column.dsc_sql_valores, sta_coluna_filtro: @column.sta_coluna_filtro, sta_obrigado: @column.sta_obrigado, tpo_objeto: @column.tpo_objeto, txt_apresentacao: @column.txt_apresentacao, universe_id: @column.universe_id }
    end

    assert_redirected_to column_path(assigns(:column))
  end

  test "should show column" do
    get :show, id: @column
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @column
    assert_response :success
  end

  test "should update column" do
    put :update, id: @column, column: { dsc_sql_valores: @column.dsc_sql_valores, sta_coluna_filtro: @column.sta_coluna_filtro, sta_obrigado: @column.sta_obrigado, tpo_objeto: @column.tpo_objeto, txt_apresentacao: @column.txt_apresentacao, universe_id: @column.universe_id }
    assert_redirected_to column_path(assigns(:column))
  end

  test "should destroy column" do
    assert_difference('Column.count', -1) do
      delete :destroy, id: @column
    end

    assert_redirected_to columns_path
  end
end
