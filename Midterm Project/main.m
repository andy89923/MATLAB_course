clear all
clc

% char to int
function ans = getNum(c)
	if '0' <= c & c <= '9'
		ans = c - '0';
		return
    end
	ans = c + 10 - 'A';
end

% int to char(include greater than 10)
function ans = getAlp(c)
	if 0 <= c & c <= 9
		ans = c + '0';
		return
	end
	ans = c + 'A' - 10;
end

% base-M to base-N
function ans = ConvertToBaseN(num, M, N, maxPoi)
	ans = ConvertToDec(num, M);

	ter = fix(ans);
	rod = ans - ter;

	ans = "";
	while ter > 0
        now = getAlp(mod(ter, N));
		ans = ans + char(now);
		ter = fix(ter / N);
	end
	ans = reverse(ans);

	ans = ans + '.';
	for i = 1 : 1 : maxPoi
		tmp = fix(rod * N);
        now = getAlp(tmp);
		ans = ans + char(now);
		rod = rod * N - tmp;
	end

end

% base-M to Decimal
function ans = ConvertToDec(num, M)
	numlis = char(num);

	t = length(numlis) + 1;

	for i = 1 : 1 : t - 1
		if numlis(i) == '.'
			t = i;
			break;
        end
    end
    
    ans = 0.0;
	now_base = 1.0;
	for i = t - 1 : -1 : 1
		ans = ans + (now_base * getNum(numlis(i)));
		now_base = now_base * M;
	end

	now_base = (M ^ -1);
	for i = t + 1 : 1 : length(numlis) 
		ans = ans + (now_base * getNum(numlis(i)));
		now_base = now_base * (M ^ -1);
    end
end