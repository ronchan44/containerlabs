module.exports = {
  rules: {
     'type-enum': [
      2,
      'always',
      ['feat', 'fix', 'chore', 'docs', 'style', 'refactor', 'test', 'perf'],
    ],
    'header-pattern': [2, 'always', /^(feat|fix|chore|docs|style|refactor|test|perf): .+/],
    'header-max-length': [2, 'always', 72],
  },
};

