import AppBar from '@mui/material/AppBar';
import Container, { ContainerProps } from '@mui/material/Container';
import Toolbar from '@mui/material/Toolbar';
import { styled } from '@mui/material';

const Offset = styled('div')(({ theme }) => theme.mixins.toolbar);

type NavbarProps = Pick<ContainerProps, 'maxWidth'> & {
  width: string;
};

export default function Header({ maxWidth, width }: NavbarProps) {
  return (
    <>
      <AppBar position="fixed">
        <Toolbar disableGutters variant="dense">
          <Container maxWidth={maxWidth} sx={{ width }}>
            Gioele De Vitti
          </Container>
        </Toolbar>
      </AppBar>
      <Offset />
    </>
  );
}
