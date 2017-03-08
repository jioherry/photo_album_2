class PhotosController < ApplicationController

	def index
		@photos = Photo.all   # seeds.rb 內畫好的表格，丟進 controller 內
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to photos_url # 將相片key入標題、日期、敘述，選擇一張照片，上傳後回到首頁
		else
			render :new 
		end
	end

	def show
		@photo = Photo.find(params[:id]) # 從資料庫裡尋找我們需要的相片，找到後，用一個網頁show出來
	end

	def edit
		@photo = Photo.find(params[:id]) 
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update_attributes(photo_params) # 不知道這一行的意思，請解惑??!
			redirect_to photos_path(@photo) # same to redirect_to photos_url
		else
			render :edit
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to photos_url
	end

	private

	def photo_params # 告訴 controller 可執行參數“修改”動作。 .require 語法不清楚，請解惑??!
		params.require(:photo).permit(:title, :date, :description, :file_location) 
	end

end
