import Head from 'next/head';

export * as config from 'monorepo/ts/next.js/next.config';

export function HeaderTags() {
	return (
		<Head>
			<meta
				content="default-src 'self'"
				httpEquiv="Content-Security-Policy"
			/>
		</Head>
	);
}