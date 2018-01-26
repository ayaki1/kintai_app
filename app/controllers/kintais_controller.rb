class KintaisController < ApplicationController
  def index
  end

  def new
    now_time = Time.current
    # 今日のはじまり
    from = now_time.beginning_of_day
    # 今日のおわり
    to = now_time.end_of_day
    @kintai = current_user.kintais.find_or_initialize_by(created_at: from..to)
  end

  def create
    if Kintai.create(user_id: current_user.id, started_at: Time.current)
      flash[:success] = '本日も頑張って行きましょう！'
      redirect_to new_kintai_path
    else
      render :new
    end
  end
  
  def update
    @kintai = Kintai.find(params[:id])
    if @kintai.update(finished_at: Time.current)
      flash[:success] = '本日もお疲れ様でした！'
      redirect_to root_path
    else
      render :new
    end
  end
end
