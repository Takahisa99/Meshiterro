class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end


  #投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end



  def index
    @post_images = PostImage.all
  end


  def show
    @post_image = PostImage.find(params[:id])
  end



  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.john('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  #投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
