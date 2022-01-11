// A styled version of the Next.js Link component:
// https://nextjs.org/docs/#with-link
import clsx from 'clsx';
import { useRouter } from 'next/router';
import NextLinkComposed from 'modules/molecules/NextLinkComposed';
import React from 'react';
import MuiLink from '@mui/material/Link';

type LinkProps = Partial<{
  activeClassName: string;
  as: object | string;
  className: string;
  href: any;
  linkAs: object | string;
  noLinkStyle: boolean;
  role: string;
}>;

const Link = React.forwardRef<HTMLAnchorElement, LinkProps>(function Link(
  {
    activeClassName = 'active',
    as: linkAs,
    className: classNameProps,
    href,
    noLinkStyle,
    role, // Link does not have roles
    ...other
  },
  ref
) {
  const router = useRouter();
  const pathname = typeof href === 'string' ? href : href.pathname;
  const className = clsx(classNameProps, {
    [activeClassName]: router.pathname === pathname && activeClassName,
  });

  const isExternal =
    typeof href === 'string' &&
    (href.indexOf('http') === 0 || href.indexOf('mailto:') === 0);

  if (isExternal) {
    if (noLinkStyle) {
      return <a className={className} href={href} ref={ref} {...other} />;
    }
    return <MuiLink className={className} href={href} ref={ref} {...other} />;
  }

  if (noLinkStyle) {
    return (
      <NextLinkComposed className={className} ref={ref} to={href} {...other} />
    );
  }

  return (
    <MuiLink
      component={NextLinkComposed}
      linkAs={linkAs}
      className={className}
      ref={ref}
      to={href}
      {...other}
    />
  );
});

export default Link;
