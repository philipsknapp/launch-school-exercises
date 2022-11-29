def featured(num)
  feat = num + 7 - (num % 7)
  feat += 7 if feat.even?
  while feat < 10_000_000_000
    feat_digits = feat.digits.sort
    return feat if feat_digits.uniq == feat_digits
    feat += 14
  end
  "There is no possible number that fulfills those requirements"
end

p featured(9_999_999_999)