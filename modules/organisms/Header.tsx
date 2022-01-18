import AppBar from '@mui/material/AppBar';
import Container, { ContainerProps } from '@mui/material/Container';
import Toolbar from '@mui/material/Toolbar';
import { styled } from '@mui/material';

const Offset = styled('div')(({ theme }) => theme.mixins.toolbar);

type NavbarProps = Pick<ContainerProps, 'maxWidth'>;

export default function Header({ maxWidth }: NavbarProps) {
  return (
    <>
      <AppBar position="fixed">
        <Toolbar disableGutters variant="dense">
          <Container maxWidth={maxWidth}>Gioele De Vitti</Container>
        </Toolbar>
      </AppBar>
      <Offset />
    </>
  );
}
