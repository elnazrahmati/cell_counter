function output_image = component_finder(input_image,start_row,start_column)
    input_size = size(input_image);
    output_image = zeros(input_size);
    my_stack = zeros(500, 2);
    my_stack(1, 1) = start_row;
    my_stack(1, 2) = start_column;
    stack_top = 2;
    while stack_top ~= 1
        temp = my_stack(stack_top-1,:);
        stack_top = stack_top - 1;
        if output_image(temp(1), temp(2)) ~= 1
            output_image(temp(1), temp(2)) = 1;
            for i = -1:1
                for j = -1:1
                    if (input_image(temp(1)+i, temp(2)+j) == 1)
                        my_stack(stack_top,1) = temp(1)+i;
                        my_stack(stack_top,2) = temp(2)+j;
                        stack_top = stack_top + 1;
                    end
                end
            end
        end
    end    
end