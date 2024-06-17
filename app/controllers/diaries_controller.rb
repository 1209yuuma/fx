class DiariesController < ApplicationController
  before_action :logged_in_user
  def index
    # すべての日記を取得して表示するアクション
    @diaries = Diary.paginate(page: params[:page])
  end

  def new
    # 新しい日記を作成するためのフォームを表示するアクション
    @diary = Diary.new
  end

  def create
    # フォームから送信されたデータを使って新しい日記を作成するアクション
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to diaries_path
    else
      render :new
    end
  end

  def show
    @diaries = Diary.where(id: params[:id])
  end

  def edit
    # 特定の日記を編集するフォームを表示するアクション
    @diary = Diary.find(params[:id])
  end

  def update
    # 特定の日記を更新するアクション
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary)
    else
      render :edit
    end
  end

  def destroy
    # 特定の日記を削除するアクション
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :content) # フォームから許可するパラメータを指定
  end
end
