// Add support for the sx prop for consistency with the other branches.
import { styled } from '@mui/material';
import React from 'react';
import NextLink from 'next/link';

const Anchor = styled('a')({});

type NextLinkComposedProps = Partial<{
  href: any;
  linkAs: object | string;
  locale: string;
  passHref: boolean;
  prefetch: boolean;
  replace: boolean;
  scroll: boolean;
  shallow: boolean;
}> & {
  to: string | object;
} & any;

const NextLinkComposed = React.forwardRef<
  HTMLAnchorElement,
  NextLinkComposedProps
>(function NextLinkComposed(
  { to, linkAs, href, replace, scroll, shallow, prefetch, locale, ...other },
  ref
) {
  return (
    <NextLink
      href={to}
      prefetch={prefetch}
      as={linkAs}
      replace={replace}
      scroll={scroll}
      shallow={shallow}
      passHref
      locale={locale}
    >
      <Anchor ref={ref} {...other} />
    </NextLink>
  );
});

export default NextLinkComposed;
