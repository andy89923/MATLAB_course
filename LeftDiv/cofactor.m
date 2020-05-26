function Sol = cofactor(A)
    n = length(A);
    Sol = zeros(n, n);
    
    for i = 1:n
        for j = 1:n 
            now = zeros(n - 1);
            poi_x = 1;
            poi_y = 1;
            for row = 1:n
                if (row == i) continue;
                end
                for col = 1:n
                    if (col == j) continue;
                    end
                     now(poi_x, poi_y) = A(row, col);
                     poi_y = poi_y + 1;
                end
                poi_y = 1;
                poi_x = poi_x + 1;
            end
            Sol(i, j) = det(now) * (-1)^(i+j);
        end
    end
    Sol = Sol' / det(A);
end