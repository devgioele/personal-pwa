import Header from 'modules/organisms/Header';
import { ReactNode } from 'react';
import Footer from 'modules/organisms/Footer';
import { Grid } from '@mui/material';

const maxWidth = 'lg';

type LayoutProps = {
  children: ReactNode;
};

export default function Layout({ children }: LayoutProps) {
  return (
    <Grid
      container
      direction="column"
      style={{ height: '100vh', flexWrap: 'nowrap' }}
      spacing={2}
    >
      <Grid item>
        <Header maxWidth={maxWidth} />
      </Grid>
      <Grid item xs>
        <main style={{ height: '100%' }}>{children}</main>
      </Grid>
      <Grid item>
        <Footer maxWidth={maxWidth} />
      </Grid>
    </Grid>
  );
}
