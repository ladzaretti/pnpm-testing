import { Timeline, makeYears } from '@zemn.me/timeline/components';
import Eye from '@zemn.me/art/time';
import { Text } from '@zemn.me/lang/component';
import { Bio } from '@zemn.me/bio';
import { Main, Div, A } from '@zemn.me/linear';
import Video from '@zemn.me/video';
import React from 'react';
import style from './home.module.css';
import * as i8n from '@zemn.me/linear/i8n';
import { TaggedTextContext } from '@zemn.me/lang/component';
import * as bio from 'lib/bio';

interface HomeProps {
    filter?: (event: bio.Event) => boolean
}

const Home:
    (props: HomeProps) => React.ReactElement
= ({ filter }) => {
    const [langs, setLang] = React.useState<readonly string[]>(["en-gb"]);
    React.useEffect(() => {
        const onLangChange = () => setLang(navigator.languages);
        window.addEventListener('languagechange', onLangChange);
        const curLang = window?.navigator?.languages;
        if(curLang) setLang(curLang);
        return () => window.removeEventListener('languagechange', onLangChange);
    }, [ setLang ]);

    const tl = React.useMemo(() => {
        if (filter == undefined) return bio.timeline;
        return bio.timeline.filter(filter)
    }, [ filter ]);

    const years = React.useMemo(() => makeYears(tl), [tl])

    const [l] = langs;

    const content = <>
        <Div className={style.header}>
            <Text into={<Div className={style.title}/>}>{Bio.who.handle}</Text>
            <Video/>
        </Div>

        <Div className={style.links}>
            {Bio.links.map(([label, link], i) => <Text key={i} {...{
                into: <A href={link}/>
            }}>{label}</Text>)}
        </Div>

        <Div className={style.navBar}>
            <Div className={style.eyeContainer}>
                <Eye className={style.eye}/>
            </Div>
        </Div>

        <Text into={<Div className={style.name}/>}>{Bio.who.name}</Text>

        <Timeline {...{
            years,
            lang: 'en-GB',
            className: style.timeline
        }} />
    </>
return <Main lang={l} className={style.home}>
    <i8n.locale.Provider value={langs}>
        <TaggedTextContext.Provider value={{ lang: l }}>
            {content}
        </TaggedTextContext.Provider>
    </i8n.locale.Provider>
</Main>
}

export default Home;