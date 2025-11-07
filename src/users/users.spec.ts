import { User } from './users';

describe('Users', () => {
  it('should be defined', () => {
    expect(new User()).toBeDefined();
  });
});
