require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @user = users(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  # --- A partir de aquí todas las acciones requieren inicio de sesión ---

  test "should get new" do
    sign_in_as(@user) # Iniciamos sesión antes de pedir el formulario
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    sign_in_as(@user) # Iniciamos sesión antes de hacer el POST
    assert_difference("Article.count") do
      post articles_url, params: {
        article: {
          description: @article.description,
          title: @article.title
          # El controlador debería asignarlo usando el current_user de la sesión.
        }
      }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "test_should_get_edit" do
    sign_in_as(@user) # Iniciamos sesión antes de pedir la edición
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    sign_in_as(@user) # Iniciamos sesión antes de enviar la actualización
    patch article_url(@article), params: { article: { description: @article.description, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    sign_in_as(@user) # Iniciamos sesión antes de borrar
    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
