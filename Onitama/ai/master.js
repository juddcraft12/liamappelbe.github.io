load("ai/core.js");

function runAi_hard(s) {
  var r = runBasicAi(s, 4, {
    recursiveScoreWeight: 3,
    randomFactor: 1e-9,
    pieceFactor: 1.0,
    groupFactor: 0.01,
    stoneFactor: 0.03,
    streamFactor: 0.1,
  });
  print("FINAL RESULT: ", r);
  return r[0];
}
