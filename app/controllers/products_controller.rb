class ProductsController < ApplicationController
	def index
		@products= Product.all		
	end

	def new
		@product = 	Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def destroy
		product = Product.find(params[:id])
		product.destroy
		redirect_to products_path
	end

	def create
		product = Product.new(product_params)
		if product.save
			redirect_to products_path
		else
		end
	end

	def update
		product = Product.find(params[:id])
		product.category_ids.each{|x| product.categories.delete(x)}
		product.update(product_params)
		redirect_to products_path

		end

	def noesta(arr1,arr2)
	# metodo que permite sacar los elementos que no estan contenidos 
	# en el arreglo 2 y si en el arreglo 1

	# arr1=[1,2,3,4,5,6]
	# arr2=[2,4,6,8,10,12]
	# noesta(arr1,arr2) =>  [1,3,5]
	# noesta(arr2,arr1) =>  [8,10,12]
	#
	arr1.map!{|x| x.to_i}
	arr2.map!{|x| x.to_i}
	arr1.reduce([]){  |accu,element|

	 if arr2.include? element.to_i
		accu    
	 else
		accu<< element
	 end

	}
end

	private

	def product_params
		params.require(:product).permit(:name,:price,category_ids:[])
	end

end
