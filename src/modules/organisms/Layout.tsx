import Navbar from 'modules/organisms/Navbar';
import { ReactNode } from 'react';
import Footer from 'modules/organisms/Footer';

type LayoutProps = {
  children: ReactNode;
};

export default function Layout({ children }: LayoutProps) {
  return (
    <>
      <Navbar maxWidth="lg" width="80%" />
      <main>{children}</main>
      <Footer />
    </>
  );
}
