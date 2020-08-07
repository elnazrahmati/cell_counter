function output_image = My_bwlabel(I)
    levels = multithresh(I,2);
    temp = imquantize(I, levels);
    input_image = (temp>1);
    count = 1;
    input_size = size(input_image);
    output_image = zeros(input_size);
    temp = zeros(input_size(1),1);
    input_image = horzcat(temp, input_image);
    input_image = horzcat(input_image, temp);
    temp = zeros(1,input_size(2)+2);
    input_image = vertcat(temp, input_image);
    input_image = vertcat(input_image, temp);
    for i = 1:input_size(1)
       for j = 1:input_size(2)
          if input_image(i+1, j+1) == 1
             temp_image = component_finder(input_image,i+1,j+1);
             input_image = input_image - temp_image;
             output_image = output_image + (temp_image(2:input_size(1)+1,2:input_size(2)+1) * count);
             count = count + 1;
          end
       end
    end
end