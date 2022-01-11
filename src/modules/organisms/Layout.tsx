import Navbar from 'modules/organisms/Navbar';
import { ReactNode } from 'react';
import Footer from 'modules/organisms/Footer';
import { Grid } from '@mui/material';

type LayoutProps = {
  children: ReactNode;
};

export default function Layout({ children }: LayoutProps) {
  return (
    <Grid
      container
      direction="column"
      style={{ height: '100vh', flexWrap: 'nowrap' }}
    >
      <Grid item>
        <Navbar maxWidth="lg" width="80%" />
      </Grid>
      <Grid item xs>
        <main style={{ height: '100%' }}>{children}</main>
      </Grid>
      <Grid item>
        <Footer maxWidth="lg" width="80%" />
      </Grid>
    </Grid>
  );
}
