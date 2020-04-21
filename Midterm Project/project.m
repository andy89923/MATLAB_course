clear all
clc

% input should all be string
% all of the outputs are sting too
p1("43.85")
p2("101011.11011001")
p3_1("43.85")
p3_2("2B.D99")


% Problem 1 : decimal to binary
function ans = p1(ss)
	ans = ConvertToBaseN(ss, 10, 2, 8);
end

% Problem 2 : binary to decimal
function ans = p2(ss)
	ans = ConvertToDec(ss, 2);
end

% Problem 3-1: decimal to Hex
function ans = p3_1(ss)
	ans = ConvertToBaseN(ss, 10, 16, 3);
end

% Problem 3-2: Hex to decimal
function ans = p3_2(ss)
	ans = ConvertToDec(ss, 16);
end

% Problem 4-1: decimal to base-R
function ans = p4_1(ss, R)
	ans = ConvertToBaseN(ss, 10, R, 5);
end

% Problem 4-2: base-R to decimal
function ans = p4_2(ss, R)
	ans = ConvertToDec(ss, R);
end

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