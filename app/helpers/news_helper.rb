module NewsHelper
	def replaceImgTags text
		sub = /<img[\d]+>/.match(text)
		while sub
			str = sub.to_s 
			str['<img'] = ""
			str['>'] = ""
			 if Image.where(:id => str.to_i).first
				#temp = '<div class="imgInNews">' + image_tag(Image.where(:id => str.to_i).first.picture.url, :width => 80) + '</div>' 
				temp = content_tag :div, :class => 'imgInNews' do
					image_tag(Image.where(:id => str.to_i).first.picture.url, :width => 80)
				end
				text[sub.to_s] = temp #set width only for debug
			 else
				text[sub.to_s] = " "
			end
			sub = /<img[\d]+>/.match(text)
		end
		sanitize text #confirm html tags
	end
end
