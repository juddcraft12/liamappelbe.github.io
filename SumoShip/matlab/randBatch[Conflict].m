function B = randBatch(N, stateShape, stateBias, actionShape, actionBias, transferFunc, rewardFunc)
  B.p = rand(N, length(stateShape)) .* repmat(stateShape, N, 1) + repmat(stateBias, N, 1);
  B.a = rand(N, length(actionShape)) .* repmat(actionShape, N, 1) + repmat(actionBias, N, 1);
  B.s = B.p;
  B.r = zeros(1, N);
  B.x = zeros(N, length(stateShape) + length(actionShape));
  for i = 1:N
    B.s(i, :) = transferFunc(B.p(i, :), B.a(i, :));
    B.r(i, :) = rewardFunc(B.p(i, :), B.a(i, :), B.s(i, :));
    B.x(i, :) = [B.p(i, :), B.a(i, :)];
  end
end
