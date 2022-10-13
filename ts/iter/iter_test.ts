import * as iter from 'monorepo/ts/iter';

describe('reduce', () => {
	test('sum', () => {
		expect(iter.reduce([1, 2, 3], (p, c) => p + c, 0)).toEqual(6);
	});
});

describe('fromEntries', () => {
	test('simple', () => {
		expect(
			iter.dict.fromEntries([
				['ok', 'cool'],
				['hi', true],
			] as Iterable<[string, string | boolean]>)
		).toEqual({
			ok: 'cool',
			hi: true,
		});
	});
});

describe('walkPath', () => {
	it('should work in a simple way', () => {
		type TreeItem = { value: string; children?: TreeItem[] };

		const tree: TreeItem = {
			value: 'eggs',
			children: [{ value: 'bacon' }, { value: 'hamburger' }],
		};

		expect(
			[...iter.walkPath(tree, v => v.children ?? [])].map(v =>
				v.map(v => v.value)
			)
		).toEqual(
			expect.arrayContaining([
				['eggs'],
				['bacon', 'eggs'],
				['hamburger', 'eggs'],
			])
		);
	});
});
