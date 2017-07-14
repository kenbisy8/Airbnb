class DiariesController < ApplicationController
  before_action :find_diary, except: [:index, :new, :create]

  def index
    respond_to do |format|
      format.html
      format.json {
        @all_diaries = Diary.search(params[:q])}
    end
  end

  def new
    @diary = Diary.new
  end

  def create
    get_country_fullName
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to "/users/#{current_user.id}", notice: "日記の登録が完了しました"
    else
      render 'new'
    end
  end

  def show
    if (@diaries.publicity == true) && (@diaries.article_user_id != current_user.id)
      redirect_to "/users/#{@diaries.article_user_id}"
    end
  end

  def edit
    user = User.find(@diaries.article_user_id)
    redirect_to root_path unless user.id == current_user.id
  end

  def update
    if @diaries.update_attributes(diary_params)
      redirect_to "/users/#{current_user.id}", notice: "日記を更新しました"
    else
      render 'edit'
    end
  end

  private

  def get_country_fullName
    params[:diary][:nation_name] = ISO3166::Country[(params[:diary][:nation_name])].name
  end

  def find_diary
    @diaries = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:article, :article_title, :article_image, :nation_name, :city_name, :publicity).merge(article_user_id: current_user.id)
  end

end
